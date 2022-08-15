using Microsoft.AspNetCore.Mvc;

namespace AzContainerAppDemo_WebGateway.App.Controllers;

[ApiController]
public class Probes : ControllerBase
{
    /// <summary>
    /// Report the overall health of your app
    /// *When to restart the container
    /// </summary>
    /// <returns></returns>
    [HttpGet("/liveness")]
    public IActionResult Health()
    {
        return Ok("Up");
    }
    
    /// <summary>
    /// Signals that a replica is ready to accept traffic
    /// Lets the env know that that it can accept traffic
    /// When not ready its removed from the loadbalancer
    /// </summary>
    /// <returns></returns>
    [HttpGet("/readiness")]
    public IActionResult Readiness()
    {
        return Ok("Ready!!");
    }

    /// <summary>
    /// Delay reporting on a liveness or readiness state
    /// When the CA has started
    /// This disables liveness & readiness until it succeeds
    /// Slow starting CA, this avoids it being killed by orchestration
    /// engine before it starts up
    /// </summary>
    /// <returns></returns>
    [HttpGet("/startup")]
    public IActionResult Startup()
    {
        return Ok("Started");
    }
}